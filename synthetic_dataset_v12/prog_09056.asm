; DESCRIPTION: Places a red 43x33 rectangle at position (428, 39).
; PLAN: r0=428(x), r1=39(y), r2=43(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 39
LDI r2, 43
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
