; DESCRIPTION: Places a green 115x25 rectangle at position (295, 113).
; PLAN: r0=295(x), r1=113(y), r2=115(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 113
LDI r2, 115
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
