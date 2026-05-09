; DESCRIPTION: Places a yellow 109x60 rectangle at position (118, 180).
; PLAN: r0=118(x), r1=180(y), r2=109(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 180
LDI r2, 109
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
