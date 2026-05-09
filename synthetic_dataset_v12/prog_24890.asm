; DESCRIPTION: Creates a cyan rectangular region at (296, 204) spanning 107 by 47 pixels.
; PLAN: r0=296(x), r1=204(y), r2=107(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 204
LDI r2, 107
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
