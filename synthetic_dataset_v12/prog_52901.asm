; DESCRIPTION: Composite: Draws a cyan line from (45, 73) to (34, 243) then Places a purple 72x13 rectangle at position (191, 160).
; PLAN: r0=45(x1), r1=73(y1), r2=34(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=191(x), r6=160(y), r7=72(width), r8=13(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 73
LDI r2, 34
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 160
LDI r7, 72
LDI r8, 13
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
