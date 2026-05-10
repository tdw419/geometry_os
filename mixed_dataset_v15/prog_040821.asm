; DESCRIPTION: Places a green 61x91 rectangle at position (127, 113).
; PLAN: r0=127(x), r1=113(y), r2=61(width), r3=91(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 113
LDI r2, 61
LDI r3, 91
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
