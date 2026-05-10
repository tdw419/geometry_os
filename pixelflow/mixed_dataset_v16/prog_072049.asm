; DESCRIPTION: Places a orange 44x107 rectangle at position (415, 143).
; PLAN: r0=415(x), r1=143(y), r2=44(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 143
LDI r2, 44
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
