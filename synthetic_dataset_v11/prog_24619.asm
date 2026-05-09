; DESCRIPTION: Composite: . Then Sets a single purple pixel at (154, 224). Then Renders a orange box of size 107x115 starting at (123, 108).
; PLAN: r0=154(x), r1=224(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=123(x), r1=108(y), r2=107(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (154, 224).
; PLAN: r0=154(x), r1=224(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 154
LDI r1, 224
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 107x115 starting at (123, 108).
; PLAN: r0=123(x), r1=108(y), r2=107(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 108
LDI r2, 107
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
