; DESCRIPTION: Places a magenta 113x90 rectangle at position (353, 146).
; PLAN: r0=353(x), r1=146(y), r2=113(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 146
LDI r2, 113
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
