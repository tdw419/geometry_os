; DESCRIPTION: Places a green 74x51 rectangle at position (294, 124).
; PLAN: r0=294(x), r1=124(y), r2=74(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 124
LDI r2, 74
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
