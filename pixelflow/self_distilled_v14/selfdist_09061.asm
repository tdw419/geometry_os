; DESCRIPTION: Places a cyan 51x19 box at position (368, 197).
; PLAN: r0=368(x), r1=197(y), r2=51(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 197
LDI r2, 51
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
