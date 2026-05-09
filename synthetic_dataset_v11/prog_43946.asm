; DESCRIPTION: Places a cyan 84x82 rectangle at position (44, 125).
; PLAN: r0=44(x), r1=125(y), r2=84(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 125
LDI r2, 84
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
