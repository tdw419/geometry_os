; DESCRIPTION: Draws a black line from (401, 207) to (494, 154).
; PLAN: r0=401(x1), r1=207(y1), r2=494(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 207
LDI r2, 494
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
