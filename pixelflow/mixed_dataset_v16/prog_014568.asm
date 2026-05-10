; DESCRIPTION: Renders a cyan box of size 93x35 starting at (371, 145).
; PLAN: r0=371(x), r1=145(y), r2=93(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 145
LDI r2, 93
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
