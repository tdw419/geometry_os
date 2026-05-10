; DESCRIPTION: Places a cyan 14x113 box at position (30, 125).
; PLAN: r0=30(x), r1=125(y), r2=14(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 125
LDI r2, 14
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
