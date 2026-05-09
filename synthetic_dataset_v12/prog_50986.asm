; DESCRIPTION: Places a yellow 27x113 rectangle at position (435, 51).
; PLAN: r0=435(x), r1=51(y), r2=27(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 51
LDI r2, 27
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
