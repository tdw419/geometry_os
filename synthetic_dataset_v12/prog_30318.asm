; DESCRIPTION: Places a purple 103x57 rectangle at position (398, 180).
; PLAN: r0=398(x), r1=180(y), r2=103(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 180
LDI r2, 103
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
