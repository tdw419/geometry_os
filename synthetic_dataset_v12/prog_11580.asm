; DESCRIPTION: Places a green 51x11 rectangle at position (368, 95).
; PLAN: r0=368(x), r1=95(y), r2=51(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 95
LDI r2, 51
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
