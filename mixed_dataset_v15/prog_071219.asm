; DESCRIPTION: Places a green 105x51 rectangle at position (298, 193).
; PLAN: r0=298(x), r1=193(y), r2=105(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 193
LDI r2, 105
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
