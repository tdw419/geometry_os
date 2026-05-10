; DESCRIPTION: Places a green 55x111 rectangle at position (162, 27).
; PLAN: r0=162(x), r1=27(y), r2=55(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 27
LDI r2, 55
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
