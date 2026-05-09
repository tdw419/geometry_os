; DESCRIPTION: Composite: . Then Places a cyan dot at position (160, 223). Then Draws a cyan line from (28, 156) to (82, 50).
; PLAN: r0=160(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=28(x1), r1=156(y1), r2=82(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan dot at position (160, 223).
; PLAN: r0=160(x), r1=223(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 160
LDI r1, 223
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan line from (28, 156) to (82, 50).
; PLAN: r0=28(x1), r1=156(y1), r2=82(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 156
LDI r2, 82
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
