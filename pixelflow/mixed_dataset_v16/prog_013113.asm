; DESCRIPTION: Places a orange 75x111 rectangle at position (322, 107).
; PLAN: r0=322(x), r1=107(y), r2=75(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 107
LDI r2, 75
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
