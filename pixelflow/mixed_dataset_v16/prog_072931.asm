; DESCRIPTION: Places a yellow 66x75 rectangle at position (213, 180).
; PLAN: r0=213(x), r1=180(y), r2=66(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 180
LDI r2, 66
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
