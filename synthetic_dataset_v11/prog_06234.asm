; DESCRIPTION: Composite: . Then Places a cyan dot at position (84, 65). Then Renders a orange box of size 52x22 starting at (170, 42).
; PLAN: r0=84(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=170(x), r1=42(y), r2=52(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (84, 65).
; PLAN: r0=84(x), r1=65(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 84
LDI r1, 65
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a orange box of size 52x22 starting at (170, 42).
; PLAN: r0=170(x), r1=42(y), r2=52(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 42
LDI r2, 52
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
