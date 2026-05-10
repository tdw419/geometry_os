; DESCRIPTION: Places a yellow 40x41 box at position (197, 132).
; PLAN: r0=197(x), r1=132(y), r2=40(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 132
LDI r2, 40
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
