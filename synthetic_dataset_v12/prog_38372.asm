; DESCRIPTION: Creates a white rectangular region at (479, 171) spanning 16 by 80 pixels.
; PLAN: r0=479(x), r1=171(y), r2=16(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 171
LDI r2, 16
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
