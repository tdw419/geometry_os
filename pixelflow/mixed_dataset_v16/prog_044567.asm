; DESCRIPTION: Places a red 112x33 rectangle at position (79, 180).
; PLAN: r0=79(x), r1=180(y), r2=112(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 180
LDI r2, 112
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
