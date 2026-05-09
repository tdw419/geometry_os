; DESCRIPTION: Places a blue 111x27 rectangle at position (168, 113).
; PLAN: r0=168(x), r1=113(y), r2=111(width), r3=27(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 113
LDI r2, 111
LDI r3, 27
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
