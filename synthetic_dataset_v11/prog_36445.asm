; DESCRIPTION: Places a green 112x27 rectangle at position (82, 3).
; PLAN: r0=82(x), r1=3(y), r2=112(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 3
LDI r2, 112
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
