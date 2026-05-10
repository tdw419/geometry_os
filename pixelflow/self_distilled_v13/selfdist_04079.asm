; DESCRIPTION: Renders a red rectangular region spanning 16 by 115 at (326, 145).
; PLAN: r0=326(x), r1=145(y), r2=16(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 145
LDI r2, 16
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
