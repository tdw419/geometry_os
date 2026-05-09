; DESCRIPTION: Composite: . Then Places a red dot at position (120, 146). Then Places a cyan line segment connecting (82, 209) to (178, 160).
; PLAN: r0=120(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=82(x1), r1=209(y1), r2=178(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (120, 146).
; PLAN: r0=120(x), r1=146(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 120
LDI r1, 146
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan line segment connecting (82, 209) to (178, 160).
; PLAN: r0=82(x1), r1=209(y1), r2=178(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 209
LDI r2, 178
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
