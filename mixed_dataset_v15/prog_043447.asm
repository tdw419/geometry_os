; DESCRIPTION: Places a red 12x22 rectangle at position (146, 113).
; PLAN: r0=146(x), r1=113(y), r2=12(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 113
LDI r2, 12
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
