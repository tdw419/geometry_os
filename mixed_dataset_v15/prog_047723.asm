; DESCRIPTION: Places a red 36x40 rectangle at position (271, 113).
; PLAN: r0=271(x), r1=113(y), r2=36(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 113
LDI r2, 36
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
