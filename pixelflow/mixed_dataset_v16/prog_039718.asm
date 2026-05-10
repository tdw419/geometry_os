; DESCRIPTION: Renders a cyan line between points (284, 58) and (434, 206).
; PLAN: r0=284(x1), r1=58(y1), r2=434(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 58
LDI r2, 434
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
