; DESCRIPTION: Places a black 106x20 rectangle at position (202, 112).
; PLAN: r0=202(x), r1=112(y), r2=106(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 112
LDI r2, 106
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
