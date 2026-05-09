; DESCRIPTION: Renders a green box of size 18x19 starting at (433, 93).
; PLAN: r0=433(x), r1=93(y), r2=18(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 93
LDI r2, 18
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
