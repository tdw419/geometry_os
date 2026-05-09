; DESCRIPTION: Places a cyan line segment connecting (154, 197) to (480, 20).
; PLAN: r0=154(x1), r1=197(y1), r2=480(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 197
LDI r2, 480
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
