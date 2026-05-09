; DESCRIPTION: Places a black 33x69 rectangle at position (174, 180).
; PLAN: r0=174(x), r1=180(y), r2=33(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 180
LDI r2, 33
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
