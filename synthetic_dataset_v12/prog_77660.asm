; DESCRIPTION: Places a orange 94x48 rectangle at position (40, 180).
; PLAN: r0=40(x), r1=180(y), r2=94(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 180
LDI r2, 94
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
