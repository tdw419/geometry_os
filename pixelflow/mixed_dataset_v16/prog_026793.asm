; DESCRIPTION: Places a cyan line segment connecting (123, 98) to (154, 253).
; PLAN: r0=123(x1), r1=98(y1), r2=154(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 98
LDI r2, 154
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
