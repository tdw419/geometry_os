; DESCRIPTION: Places a green 27x17 rectangle at position (411, 84).
; PLAN: r0=411(x), r1=84(y), r2=27(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 84
LDI r2, 27
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
