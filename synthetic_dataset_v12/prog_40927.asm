; DESCRIPTION: Composite: Places a yellow circle of radius 56 at center (337, 128) then Draws a cyan line from (409, 94) to (61, 173).
; PLAN: r0=337(x), r1=128(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x1), r6=94(y1), r7=61(x2), r8=173(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 128
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 94
LDI r7, 61
LDI r8, 173
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
