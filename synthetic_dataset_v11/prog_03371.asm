; DESCRIPTION: Places a cyan 51x113 rectangle at position (99, 125).
; PLAN: r0=99(x), r1=125(y), r2=51(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 125
LDI r2, 51
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
