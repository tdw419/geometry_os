; DESCRIPTION: Creates a red rectangular region at (242, 48) spanning 30 by 50 pixels.
; PLAN: r0=242(x), r1=48(y), r2=30(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 48
LDI r2, 30
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
