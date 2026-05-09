; DESCRIPTION: Places a cyan 39x110 rectangle at position (52, 113).
; PLAN: r0=52(x), r1=113(y), r2=39(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 113
LDI r2, 39
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
