; DESCRIPTION: Places a magenta 108x50 rectangle at position (398, 166).
; PLAN: r0=398(x), r1=166(y), r2=108(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 166
LDI r2, 108
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
