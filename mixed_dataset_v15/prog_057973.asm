; DESCRIPTION: Creates a red rectangular region at (243, 210) spanning 40 by 37 pixels.
; PLAN: r0=243(x), r1=210(y), r2=40(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 210
LDI r2, 40
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
