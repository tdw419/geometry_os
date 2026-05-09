; DESCRIPTION: Composite: Draws a white circle centered at (387, 243) with radius 10 then Draws a cyan line from (293, 238) to (380, 70).
; PLAN: r0=387(x), r1=243(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x1), r6=238(y1), r7=380(x2), r8=70(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 243
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 238
LDI r7, 380
LDI r8, 70
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
