; DESCRIPTION: Composite: . Then Places a green dot at position (241, 200). Then Places a cyan 51x51 rectangle at position (121, 83).
; PLAN: r0=241(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=121(x), r1=83(y), r2=51(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (241, 200).
; PLAN: r0=241(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a cyan 51x51 rectangle at position (121, 83).
; PLAN: r0=121(x), r1=83(y), r2=51(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 83
LDI r2, 51
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
