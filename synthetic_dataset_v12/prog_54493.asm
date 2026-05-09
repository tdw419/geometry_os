; DESCRIPTION: Draws a white line from (434, 111) to (502, 204).
; PLAN: r0=434(x1), r1=111(y1), r2=502(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 111
LDI r2, 502
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
