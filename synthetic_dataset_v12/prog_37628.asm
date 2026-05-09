; DESCRIPTION: Places a cyan 84x113 rectangle at position (119, 29).
; PLAN: r0=119(x), r1=29(y), r2=84(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 29
LDI r2, 84
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
