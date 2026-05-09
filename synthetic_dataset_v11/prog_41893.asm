; DESCRIPTION: Places a white 35x91 rectangle at position (96, 127).
; PLAN: r0=96(x), r1=127(y), r2=35(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 127
LDI r2, 35
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
