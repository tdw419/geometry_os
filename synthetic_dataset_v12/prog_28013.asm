; DESCRIPTION: Draws a cyan line from (386, 255) to (237, 253).
; PLAN: r0=386(x1), r1=255(y1), r2=237(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 255
LDI r2, 237
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
