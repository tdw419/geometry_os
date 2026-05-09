; DESCRIPTION: Composite: Draws a cyan line from (334, 196) to (407, 68) then Places a green dot at position (313, 38).
; PLAN: r0=334(x1), r1=196(y1), r2=407(x2), r3=68(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=313(x), r6=38(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 334
LDI r1, 196
LDI r2, 407
LDI r3, 68
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 38
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
