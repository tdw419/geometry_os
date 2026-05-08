; DESCRIPTION : Draw s a w hit e di a g on al li ne from the to p - left ( 0 , 0 ) to the b ot to m - right ( 255 , 255 ) .
LDI r1, 0
LDI r2, 2
LDI r3, 256
LDI r4, 256
LDI r5, 0x0000CC
RECTF r1, r2, r3, r4, r5
LDI r1, 10
LDI r2, 10
LDI r3, 16
LDI r4, 40
LDI r5, 0x0000FF
RECTF r1, r2, r3, r4, r5

; G re en b ut t on ( blue b lo ck ) as at b ot to m over l a be l
LDI r1, 0
LDI r2, 256
LDI r3, 40
LDI r4, 10
LDI r5, COLOR_Y
RECTF r1, r2, r3, r4, r5

; O r s or re d in di c at or b or der
LDI r1, 2
LDI r2, 0
LDI r3, 256
LDI r4, 16
LDI r5, COLOR_Y
RECTF r1, r2, r3, r4, r5

; Y el lo w b lo ck
LDI r1, 0
LDI r2, 256
LDI r3, 1