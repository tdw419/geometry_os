; DESCRIPTION: Places a green 111x85 rectangle at position (28, 47).
; PLAN: r0=28(x), r1=47(y), r2=111(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 47
LDI r2, 111
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
