; DESCRIPTION: Renders a cyan line between points (284, 154) and (494, 33).
; PLAN: r0=284(x1), r1=154(y1), r2=494(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 154
LDI r2, 494
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
