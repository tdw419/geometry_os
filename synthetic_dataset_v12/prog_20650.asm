; DESCRIPTION: Composite: Renders a yellow box of size 16x66 starting at (314, 38) then Draws a cyan line from (398, 36) to (503, 66).
; PLAN: r0=314(x), r1=38(y), r2=16(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x1), r6=36(y1), r7=503(x2), r8=66(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 38
LDI r2, 16
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 36
LDI r7, 503
LDI r8, 66
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
